A little tool to maintain an "open source" team using the new Github
organisations API.

Usage
=====

1. Get the code

    git clone git@github.com:bugsnag/open-source-team

2. Install dependencies

    cd open-source-team
    bundle install

4. Export your [access key](https://github.com/settings/applications)

    export OCTOKIT_ACCESS_TOKEN=xxxxx

3. Run the code

    ./open-source-team.rb bugsnag open-source
