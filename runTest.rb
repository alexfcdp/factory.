require './factory'

p '----------------- ::new ---------------------------------------------------'
p Factory.new('Customer', :name, :address)
p Factory::Customer.new('Dave', '123 Main')

Customer2 = Factory.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end
p Customer2.new('Dave', '123 Main').greeting

p Customer3 = Factory.new(:name, :address)
p Customer3.new('Dave', '123 Main')
p '----------------- #==  #eql?  #[]  #[]=  #hash ----------------------------'
Custom = Factory.new(:name, :address, :zip)
p joe = Custom.new('Joe Smith', '123 Maple, Anytown NC', 12_345)
p joejr = Custom.new('Joe Smith', '123 Maple, Anytown NC', 12_345)
p jane = Custom.new('Jane Doe', '456 Elm, Anytown NC', 12_345)
p '--- == ---'
p joe == joejr
p joe == jane
p '--- eql? ---'
p joe.eql? joejr
p jane.eql? joejr
p '--- hash ---'
p joe.hash
p joejr.hash
p '--- [] ---'
p joe['name']
p joe[:name]
p joe[0]
p '--- []= ---'
p joe['name'] = 'Luke'
p joe[:zip] = '90210'
p joe.name
p joe.zip
p '--------------------------#dig-----------------------------------------------'
Foo = Factory.new(:a)
p f = Foo.new(Foo.new(b: [1, 2, 3]))
p f.dig(:a, :a, :b, 0)
p f.dig(:b, 0)
# p f.dig(:a, :a, :b, :c)
p '------------#each #each_pair #length #members #to_a #to_h #values_at---------'
Customer4 = Factory.new(:name, :address, :zip)
p joe = Customer4.new('Joe Smith', '123 Maple, Anytown NC', 12_345)
p '---each---'
p joe.each { |x| puts(x) }
p '---each_pair---'
p joe.each_pair { |name, value| puts("#{name} => #{value}") }
p '---length || size---'
p joe.length
p '---members---'
p joe.members
p '---to_a || values---'
p joe.to_a[1]
p '---to_h---'
p joe.to_h[:address]
p '---values_at---'
p joe.values_at(0, 2)
p '---to_s || inspect---'
p joe.to_s
p '------------------#select-----------------------------------------------------'
Lots = Factory.new(:a, :b, :c, :d, :e, :f)
p l = Lots.new(11, 22, 33, 44, 55, 66)
p l.select(&:even?)
