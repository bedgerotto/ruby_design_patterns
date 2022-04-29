# frozen_string_literal: true

class Gateway
  def initialize(message)
    @message = message
    load_adapters
    load_authorizers
  end

  def self.send(message)
    new(message).process_message
  end

  def process_message
    adapter = fetch_message_adapter
    raise "NotAuthorized" unless authorized?

    adapter.send_message @message
  end

  def fetch_message_adapter
    protocol = @message.to.scheme.downcase
    adapter_name = "#{protocol.capitalize}Adapter"
    adapter_class = self.class.const_get adapter_name

    adapter_class.new
  end

  private

  def load_adapters
    lib_dir = File.dirname(__FILE__)
    full_pattern = File.join(lib_dir, 'adapters', '*.rb')
    Dir.glob(full_pattern).sort.each { |file| require file }
  end

  def load_authorizers
    lib_dir = File.dirname(__FILE__)
    full_pattern = File.join(lib_dir, 'auth', '*.rb')
    Dir.glob(full_pattern).sort.each { |file| require file }
  end

  def camel_case(string)
    tokens = string.split('.')
    tokens.map! { |t| t.capitalize}
    tokens.join('Dot')
  end

  def fetch_authorizer
    to_host = @message.to.host || 'default'
    authorizer_class = "::#{camel_case(to_host)}Authorizer"
    authorizer_class = self.class.const_get(authorizer_class)
    authorizer_class.new
  end

  def worm_case(string)
    tokens = string.split('.')
    tokens.map! {|t| t.downcase}
    tokens.join('_dot_')
  end

  def authorized?
    authorizer = fetch_authorizer
    user_method = "#{worm_case(@message.from)}_authorized?"
    return authorizer.send(user_method, @message) if authorizer.respond_to?(user_method)

    authorizer.authorized?(@message)
  end
end
