# DRAFT
The iterator pattern is what we should use when we want to handle collections of elements. It's divided by External iterators and internal iterators.

External are called this way because the iterator is a separated object from the aggregate

Usage example:
it = ArrayIterator.new ['red', 'blue', 'green']
while it.next?
  puts("external_iterator: #{it.next_item}")
end


Internal iterators are called this way because all the iterating actions happen inside the aggregate object

Usage example:
Looper.for_each_element("teste") { |item| puts("Item: #{item}") }

ps: It's pretty much the same as the Array#each method

Enumerable usage example:

port = Portfolio.new
acc1 = Account.new name: "Acc1", balance: 1500
acc2 = Account.new name: "Acc2", balance: 2500
port.add_account acc1
port.add_account acc2
port.all? { |acc| acc.balance > 2000 }
port.any? { |acc| acc.balance > 2000 }
