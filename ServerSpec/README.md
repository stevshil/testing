# Server Spec Testing

This folder contains 2 VMs for playing with server spec.

The tests folder has a predefinied set of tests as an example, and is mounted into the VMs as /vagrant/tests

The tests folder contains an example set of tests to test MySQL on the client instance and uses the username/password to connect to the server if you are not using ssh keys.  It also contains a failure.

## Setting up serverspec manually

1. Install the required software;
  * rubygems rubygem-bundler rubygem-rake
2. As a non-root user install serverspec and highline
  * gem install serverspec
  * gem install highline
3. Create a directory for your serverspec testing environment
4. In the directory run
  * ```serverspec-init```
5. Change into the **spec** directory
6. If you used SSH to configure then create your tests in the directory named after the host or IP address
   1. Each host/ip that you wish to test for should have a directory
7. If you selected **localhost** during configuration then create your tests in the directory called **localhost**

**NOTE:** All test files should end **_spec.rb**

You can have as many test files in a directory as you like and serverspec will run all of them.  This is so you can projectise your directory.

## Lots of machines for the same tests?

If you plan to run the same set of tests for multiple servers you can simply have a shell script to run the **rake** command but changing the name of the directory containing the tests under the **spec** directory.  An example;

```
for host in $(cat myhostlist)
do
  # Set the current name for the directory containing the tests
  coredir="spec/10.0.0.20"
  # Change the directory name to the host to test
  mv $coredir spec/$host
  # Test the host
  rake spec
  # Set the test directory back to the default name
  mv spec/$host $coredir
done
```

## Changing the output format

Your serverspec tests **must** be ran using the following command in the directory that contains the **Rakefile**;
```
rake spec
```

This calls rspec under the scenes, so if you want to change the output of your tests you will need to edit the **.rspec** file and add your **rspec** options in to this file.

The default **.rspec** file has;
```
--color
--format documentation
```
