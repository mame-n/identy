require "test/unit"
require "./patient_name_id.rb"

class TC < Test::Unit::TestCase
  def setup
  end

  def test_name_id
    o = PatientNameID.new("/Users/shouichi/ruby/src/identy/DicomFiles/US000001")
    assert_equal( nil, o.name_id )
  end
end

