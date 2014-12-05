
export PATH=~/bin:$PATH
export PATH=~/Development/android-sdk-macosx/platform-tools:$PATH
export PATH=~/Development/android-sdk-macosx/tools:$PATH
export PATH=~/usr/local/bin:$PATH
export PATH=node_modules/.bin:$PATH

# for amazon ec2 api tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"

export AWS_CREDENTIAL_FILE=$HOME/.ssh/eb-cred-file-infra

ifconfig | grep inet | grep 172.31 && source corp || source red

eval "$(rbenv init -)"

#alias eb="/usr/local/AWS-ElasticBeanstalk-CLI-2.3.1/eb/macosx/python2.7/eb"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
