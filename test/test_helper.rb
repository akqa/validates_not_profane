require 'rubygems'
require 'bundler/setup'
require 'validates_not_profane'
require 'test/unit'

class Model
  include ActiveModel::Validations
  def initialize(atts)
    atts.each { |k,v| send("#{k}=", v) }
  end
end

class User < Model
  attr_accessor :name, :bio

  validates_not_profane :name
  validates_not_profane :bio, :tolerance => 5
end

class Post < Model
  attr_accessor :subject, :post

  validates_not_profane :subject, :racist => true
  validates_not_profane :post,    :sexual => true
end

class Test::Unit::TestCase
  def assert_valid(record)
    assert_block { record.valid? }
  end

  def assert_invalid(record)
    assert_block { !record.valid? }
  end
end
