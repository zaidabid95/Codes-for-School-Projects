clear all

load('waldtest.mat')

wald = ((R*Beta)-r)'*inv((R*(V./129)*R'))*((R*Beta)-r)