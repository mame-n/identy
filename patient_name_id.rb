class PatientNameID
  def initialize( file_path = "DicomFiles/US000001" )
    @file_path = file_path
  end

  def name_id
    result_name_id = {}

    open( @file_path, "rb" ) do |fp|
      fp.read(128)
      dicom_prefix = fp.read(4).unpack("a4")
      if dicom_prefix[0] != "DICM"
        return ;
      end

      allget = 0
      while allget < 3 && (data = fp.read(6)) != nil # Tag1, Tag2, VR, size
        header = data.unpack("S2A2")
        body = fp.read( body_size( fp, header ) )
        puts "header #{header} body #{body}"
        if header[0] == 0x0010 && header[1] == 0x0010 # Patient name
          allget += 1
          result_name_id[:pname] = body.unpack("A*")
        elsif header[0] == 0x0010 && header[1] == 0x0020  # Patirnt ID
          allget += 1
          result_name_id[:pid] = body.unpack("A*")
        elsif header[0] == 0x0008 && header[1] == 0x0020  # Study date
          allget += 1
          result_name_id[:study_date] = body.unpack("A*")
        else
        end
      end
    end

    result_name_id
  end

  def body_size( fp, header )
    if header[2] == "OB" || header[2] == "OR" || header[2] == "SQ" || header[2] == "OW" || header[2] == "UN"
      fp.read(2)
      fp.read(4).unpack("L")[0]
    else
      fp.read(2).unpack("S")[0]
    end
  end
end
