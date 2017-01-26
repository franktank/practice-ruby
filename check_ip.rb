# https://leetcode.com/problems/validate-ip-address/

def valid_ip_address(ip)
    is_ip4 = false
    is_ip6 = true
    if ip.index(".")
        ipc = ip.split(".")
        if ipc.all? { |x| 0 <= x.to_i && x.to_i <= 255 }
            is_ip4 = true
        end
    elsif ip.index(":")
        ipc = ip.split(":")
        # if ipc.all? { |x| x == 0 ? x.hex = 0 : x.hex != 0 }
        #     is_ip6 = true
        # end
        # if ipc.all? { |x| x == 0 && x.hex != 0}
        # end
        
        # OR
        ipc.each do |component|
            component.chars.each do |c|
                if c != '0'
                    if c.hex == 0
                        is_ip6 = false
                    end
                end
            end
        end
    end
    
    if is_ip4
        "IPv4"
    elsif is_ip6
        "IPv6"
    else
        "Neither"
    end
end

p valid_ip_address("2001:0db8:85a3:0:0:8A2E:0370:7334")
p valid_ip_address("2001:0db8:85a3:0:0:82ZE:0370:7334")