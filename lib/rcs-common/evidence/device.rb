require 'rcs-common/evidence/common'

module RCS

module DeviceEvidence
  def content
    "The time is #{Time.now} ;)".to_utf16le_binary
  end

  def generate_content
    [ content ]
  end

  def decode_content(common_info, chunks)
    info = Hash[common_info]
    info[:data] = Hash.new
    info[:data][:content] = chunks.join.utf16le_to_utf8
    yield info
  end
end

end # RCS::
