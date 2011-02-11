require 'test_helper.rb'

class ValidatesNotProfaneTest < Test::Unit::TestCase

  def test_basic_blocks_profane
    u = User.new(:name => "fucker")
    assert_invalid(u)
  end

  def test_basic_allows_clean
    u = User.new(:name => "Steve")
    assert_valid(u)
  end

  def test_tolerance_blocks
    u = User.new(:bio => "fucking prick") # badness = 5
    assert_invalid(u)
  end

  def test_tolerance_allows
    u = User.new(:bio => "queef") # badness = 4
    assert_valid(u)
  end

  def test_racist_blocks
    u = Post.new(:subject => "mick")
    assert_invalid(u)
  end

  def test_racist_allows_others
    u = Post.new(:subject => "fucker")
    assert_valid(u)
  end

  def test_sexual_blocks
    u = Post.new(:post => "cocksucker")
    assert_invalid(u)
  end

  def test_sexual_allows_others
    u = Post.new(:post => "mick") # again, I'm Irish
    assert_valid(u)
  end

  def test_default_message
    u = User.new(:name => "fucker")
    assert_invalid(u)
    assert_equal ["contains profanity"], u.errors[:name]
  end

  class CustomUser < Model
    attr_accessor :name
    validates_not_profane :name, :message => "Sorry, can't say that!"
  end

  def test_custom_message
    u = CustomUser.new(:name => "fucker")
    assert_invalid(u)
    assert_equal ["Sorry, can't say that!"], u.errors[:name]
  end
end
