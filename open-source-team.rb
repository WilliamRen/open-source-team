#!/usr/bin/env ruby
#
# A little tool to maintain an open-source team under an organisation.
#
require 'octokit'

org = ARGV[0]
team = ARGV[1]

unless org && team
  puts "Usage: open-source-team.rb <organization> <team>"
  exit 1
end

Octokit.auto_paginate = true
Octokit.access_token = ENV["OCTOKIT_ACCESS_KEY"]

repos = Octokit.repos(org).select{ |repo| repo.private == false }

teams = Octokit.get("/orgs/#{org}/teams").select{ |t| t.slug == team }

unless teams.any?
  puts "No such team #{team} in #{org}"
  exit 1
end

team_id = teams[0].id

repos.each do |repo|
  puts "Adding #{org}/#{repo.name} to #{team}"
  Octokit.put("/teams/#{team_id}/repos/#{org}/#{repo.name}")
end



