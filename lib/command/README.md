# DRAFT

The command pattern consists in creating classes that know how to execute some specific task. It may also know how to undo the same task

In this example we also used the Composite patter no aggrgate a few commands to execute and unexecute them

Usage example
cmds = CompositeCommand.new
cmds.add_command(CreateFile.new('file1.txt', "hello world\n"))
cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.execute # Should create the file2.txt
cmds.unexecute # Shoul delete all the created files