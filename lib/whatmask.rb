require 'whatmask/version'

class Whatmask

  def initialize(mask, address=nil)
    @mask = get_mask(mask)
    if /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.match(address)
      @address = octets_to_bin(address)
    end
    @allones = "11111111111111111111111111111111".to_i(2)
    validate(@mask)
  end

  def address
    return bin_to_octets(@address) if @address
  end

  def network
    return bin_to_octets(get_network) if @address
  end

  def broadcast
    return bin_to_octets(get_broadcast) if @address
  end

  def first
    if @mask != @allones
      return bin_to_octets(get_network+1) if @address
    end
    return address if @address
  end

  def last
    if @mask != @allones
      return bin_to_octets(get_broadcast-1) if @address
    end
    return address if @address
  end

  def inverse
    return bin_to_octets(get_inverse)
  end

  def mask
    return bin_to_octets(@mask)
  end

  def hex
    return bin_to_hex(@mask)
  end

  def cidr
    return @mask.to_s(2).count('1')
  end

  def avail
    return ((2**(32-cidr))-2) if cidr <= 30
    return 1
  end

  private

  def get_network
    return (@address & @mask)
  end

  def get_inverse
    return (@mask ^ @allones)
  end

  def get_broadcast
    return (get_network | get_inverse)
  end

  def validate(mask)
    mask = bin_to_32bit(mask)
    if mask[0] == '1'
      if /1/.match(mask.sub(/1+/, '0')) == nil
        return 1
      else
        abort 'whatmask: "'+mask+'" is not a valid subnet mask or wildcard bit mask!'
      end
    elsif mask == '0'*32
      return 1
    elsif mask[0] == '0'
      if /0/.match(mask.sub(/0+/, '1')) == nil
        @mask = get_inverse
        return 1
      else
        abort 'whatmask: "'+mask+'" is not a valid subnet mask or wildcard bit mask!'
      end
    else
      abort 'whatmask: error encountered in validation'
    end
  end

  def get_mask(mask)
    if (/\h\h\h\h\h\h\h\h/ =~ mask) == 2
      return mask.hex
    elsif mask.length <= 2
      return cidr_to_bin(mask)
    elsif /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.match(mask)
      return octets_to_bin(mask)
    else
      abort 'whatmask: "'+mask+'" is not a valid subnet mask or wildcard bit mask!'
    end
  end

  def bin_to_32bit(bin)
    bits = bin.to_s(2)
    while bits.length < 32
      bits = '0'+bits
    end
    return bits if (bits.length <= 32)
    abort 'whatmask: "'+bin+'" is greater than 32 bits!'
  end

  def bin_to_octets(bin)
    bin = bin.to_s(2)
    while bin.length < 32
      bin = '0'+bin
    end
    return bin.scan(/.{8}/).map { |b| b.to_i(2) }.join('.')
  end

  def bin_to_hex(bin)
    bin = bin.to_s(2)
    while bin.length < 32
      bin = '0'+bin
    end
    return '0x'+bin.scan(/.{8}/).map { |b| ('0'+b.to_i(2).to_s(16))[-2,2] }.join
  end

  def octets_to_bin(octets)
    bin = octets.split('.').map { |octet|
      octet = octet.to_i.to_s(2)
      if octet.length > 8
        abort 'whatmask: "'+octets+'" is not a valid subnet mask or wildcard bit mask, or ip address!'
      end
      while octet.length < 8
        octet = '0'+octet
      end
      octet }.join.to_i(2)
    return bin
  end

  def cidr_to_bin(cidr)
    bin = ''
    if (0..32) === cidr.to_i
      for i in 0..(cidr.to_i-1)
        bin = '1'+bin
      end
      while bin.length < 32
        bin = bin+'0'
      end
      return bin.to_i(2)
    else
      abort 'whatmask: '+cidr+' is an invalid CIDR mask!'
    end
  end
end
