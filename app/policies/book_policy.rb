class BookPolicy < Hogar::ApplicationPolicy

  def test?
    puts "testing"
    true
  end

end