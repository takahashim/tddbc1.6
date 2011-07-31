# encoding: utf-8
require './kv'
require 'rspec'

describe KV do
  before do
    @kv = KV.new
  end

  context "keyが'k'でvalueが'v'のペアが入っている場合" do
    before do
      @kv.put("k", "v")
    end

    it "getでkeyに対応するvalueを取得できる" do
      @kv.get("k").should == "v"
    end

    it "dumpで一覧表示" do
      @kv.dump_string.should == "k: v\n"
    end

    it "deleteで指定したkeyとvalueを削除する" do
      @kv.delete("k")
      @kv.get("k").should == nil
    end

    it "kが削除されていること" do
      @kv.delete("k")
      @kv.dump_string.should == ""
    end

    it "putの引数に既に存在するkeyが指定された場合、valueのみを更新する" do
      @kv.put("k", "v2")
      @kv.get("k").should == "v2"
    end
  end

  context "複数個値を持っている場合" do
    before do
      @kv.put("k", "v")
      @kv.put("k2", "v2")
    end
    it "dumpで一覧表示" do
      @kv.dump_string.should == "k: v\nk2: v2\n"
    end
  end

  it "keyとvalueのセットを一度に複数追加できること" do
    @kv.mput(["k", "k2"], ["v", "v2"])
    @kv.get("k").should == "v"
    @kv.get("k2").should == "v2"
  end

  it "個数が違う場合例外が発生すること" do
    expect { @kv.mput(["k", "k2"], ["v", "v2", "v3"]) }.to raise_error
  end

end
