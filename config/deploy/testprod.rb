# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

# LIVE_SERVER=$(aws ec2 describe-instances   --region=ap-southeast-2   --filter "Name=tag:Live,Values=true"   --query='Reservations[*].Instances[*].PrivateDnsName'   --output=text)
# SERVER_FILE=`cat <<EOF
# set :rails_env, 'testprod'
# server '$LIVE_SERVER',
#        user: 'ec2-user',
#        roles: %w(web app),
#        ssh_options: {
#          user: 'ec2-user',
#          keys: %w(~/.ssh/jenkins-slave-key),
#          forward_agent: false,
#          auth_methods: %w(publickey password)
#        }
# EOF`
# echo $SERVER_FILE > config/deploy/testprod.rb

server_name = `aws ec2 describe-instances   --region=ap-southeast-2   --filter "Name=tag:Live,Values=ENV['LIVEVAL']"   --query='Reservations[*].Instances[*].PrivateDnsName'   --output=text`

server_name.chop!

set :rails_env, 'testprod'

server "#{server_name}",
       user: 'ec2-user',
       roles: %w(web app),
       ssh_options: {
         user: 'ec2-user', # overrides user setting above
         keys: %w(~/.ssh/jenkins-slave-key),
         forward_agent: false,
         auth_methods: %w(publickey password)
         # password: 'please use keys'
       }
