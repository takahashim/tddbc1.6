# encoding: utf-8
require './kv'
require 'rspec'

describe "kv" do
  before do
    @kv = KV.new
  end

  it "getでkeyに対応するvalueを取得できる" do
    @kv.put("k", "v")
    @kv.get("k").should == "v"
  end

  it "putでkeyとvalueを追加する" do
    @kv.put("k2", "v2")
    @kv.get("k2").should == "v2"
  end

  it "dumpで一覧表示" do
    @kv.put("k", "v")
    @kv.dump_string.should == "k: v\n"
  end

  it "複数個値を持っている場合、dumpで一覧表示" do
    @kv.put("k", "v")
    @kv.put("k2", "v2")
    @kv.dump_string.should == "k: v\nk2: v2\n"
  end
end
