require 'benchmark/ips'

Benchmark.ips do |x|

  x.time = 5
  x.warmup = 0

  x.report("number") { 
    numberHash = {0 => "test"}
    times = 9
    for count in 1..times do
      numberHash.store(count,"number")
      # p numberHash
      count +=1
    end
  }

  x.report("string") {
    stringHash = {"0" => "test"}
    times = 9
    for count in 1..times do
      stringHash.store(count.to_s,"number")
      # p stringHash
      count +=1
    end
  }

  x.report("symbol") {
    symbolHash = {:"0" => "test"}
    times = 9
    for count in 1..times do
      symbolHash.store(count.to_s.to_sym,"number")
      # p symbolHash
      count +=1
    end
  }

  x.report("simple_number"){
    simpleNumberHash = {0 => "test"}
    simpleNumberHash.store(1,"test")
    simpleNumberHash.store(2,"test")
    simpleNumberHash.store(3,"test")
    simpleNumberHash.store(4,"test")
    simpleNumberHash.store(5,"test")
    simpleNumberHash.store(6,"test")
    simpleNumberHash.store(7,"test")
    simpleNumberHash.store(8,"test")
    simpleNumberHash.store(9,"test")
  }

  x.report("simple_string"){
    simpleStringHash = {"0" => "test"}
    simpleStringHash.store("1","test")
    simpleStringHash.store("2","test")
    simpleStringHash.store("3","test")
    simpleStringHash.store("4","test")
    simpleStringHash.store("5","test")
    simpleStringHash.store("6","test")
    simpleStringHash.store("7","test")
    simpleStringHash.store("8","test")
    simpleStringHash.store("9","test")
  }

  x.report("simple_symbol"){
    simpleSymbolHash = {:"0" => "test"}
    simpleSymbolHash.store(:"1","test")
    simpleSymbolHash.store(:"2","test")
    simpleSymbolHash.store(:"3","test")
    simpleSymbolHash.store(:"4","test")
    simpleSymbolHash.store(:"5","test")
    simpleSymbolHash.store(:"6","test")
    simpleSymbolHash.store(:"7","test")
    simpleSymbolHash.store(:"8","test")
    simpleSymbolHash.store(:"9","test")
  }

  x.compare!

end