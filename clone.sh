summon-conjur jenkins/ssh-key > ~/.ssh/id_rsa_test
ssh-add ~/.ssh/id_rsa_test
git clone git@github.com:anshumanbh/hello-jenkins.git