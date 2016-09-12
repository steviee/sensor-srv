class Reading
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :temperature, :type => Float
  field :humidity, :type => Float
  field :sensor_id, :type => String
    
end
