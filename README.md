[![Build Status](https://travis-ci.com/erehnberg/gofarR.svg?branch=master)](https://travis-ci.com/erehnberg/gofarR)

---
title: "README"
author: "Erik Rehnberg"
date: "6/25/2020"
output: html_document
---

## gofarR

The goal of this package will be to take as inputs both direct calls to the Peloton API and the workouts summary that can be directly downloaded from a user's profile page and analyze your workout data along several metrics.

### Currently working functions
* setup_peloton_data() - Reads in a .csv pulled from your profile. Takes the leaderboard_name argument
* top_instructor() -  Shows top instructor, both overall and for each discipline; defaults to all

### In progress functions
* cycling_summary() -  Breakdown of Live Classes, On-Demand Classes, and Just Ride workouts, can summarize and plot average power output by class duration, can filter by class type, nothing is pre-determined, but can be selected based off of what types of classes you've taken. 

### Currently planned function/abilities
#### From \<username>_workouts.csv
* Plot histogram of preferred times to workout (overall and by discipline)

#### From API
* Decoupling (Pwr:Hr first/second half of classs ratios) by class duration


The functions that require an interface with the API use a number of functions from bweiher's pelotonR package, which is, as of this version's release, only available on GitHub at https://github.com/bweiher/pelotonR. As a result, the functions have been directly duplicated here. If the pelotonR package is uploaded to CRAN, I will update this pacakge in order to call those functions from the dedicated package.
