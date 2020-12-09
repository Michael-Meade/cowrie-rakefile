namespace "top" do
    # TOP TCP IP
    task :tcpip do
        sh  %q{ cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.direct-tcpip.request")) .dst_ip' | sort | uniq -c | sort -bgr | head -n 10 }
    end
    # TOP SUCCESS IPS
    task :sip do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.login.success")) .src_ip' | sort | uniq -c | sort -bgr | head -n 10 }
    end
    task :fip do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.login.failed")) .src_ip' | sort | uniq -c | sort -bgr | head -n 10 }
    end
    task :pass do
        sh %q{cat cowrie.json* | jq '. | select(.password) | .password'  | sort | uniq -c | sort -bgr | head -10 }
    end
    task :user do
        sh %q{cat cowrie.json* | jq '. | select(.username) | .username'  | sort | uniq -c | sort -bgr | head -10 }
    end
    task :commands do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.command.input")) | .input' | sort | uniq -c | sort -bgr | head -n 10 }
    end
end

namespace "commands" do
    task :export do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.command.input")) | .input' > out_commands.txt }
    end
end

namespace "download" do
    task :all do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.session.file_download")) | .destfile' |  grep -v "null" }
    end
    task :top do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.session.file_download")) | .destfile' |  grep -v "null" | sort | uniq -c | sort -bgr | head -n 10 }
    end
    task :urls do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.session.file_download")) | .url' | grep -v "null" | sort | uniq -c | sort -bgr | head -n 10}
    end
    task :allurls do
        sh %q{cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.session.file_download")) | .url' | grep -v "null" | sort | uniq -c | sort -bgr }
    end
end

namespace "pass" do
    task :all do
        sh %q{cat cowrie.json* | jq '. | select(.password) | .password' }
    end
    task :export do
        sh %q{ cat cowrie.json* | jq '. | select(.eventid | contains("cowrie.command.input")) | .input' > out_pass.txt }
    end
end


namespace "user" do
    task :all do
        sh %q{cat cowrie.json* | jq '. | select(.username) | .username' }
    end
    task :export do
        sh %{cat cowrie.json* | jq '. | select(.username) | .username' > out_user.txt }
    end
end
