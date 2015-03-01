% Title: The Strategy Pattern in Matlab 2008b
% Author: Paul Williamson, Willip Limited, London
% Date: 10th Novemember 2008
% Keywords: Strategy Design Pattern, Gang of Four, 2008b, Interfaces

% Why? Wanted to share with you this code as it is now poss to define Interfaces
% and Abstract Classes within Matlab 2008b. This makes many of the Design 
% Patterns, commonly used in other OOP languages, available to Matlab.
% What? The Strategy Pattern is taken from "Design Patterns: Elements of
% Reusable OO Software" by Gamma, Helm, Johnson and Vlissides (also known 
% as the "Gang of Four") 

% Definition as defined by GoF: Defines a family of algorithms, encapsulates
% each one, and makes them interchangeable. Strategy lets the algorithm
% vary independently from clients that use it.

% Main.m (this file)
% Usage: Create separate files for Main.m, Strategy.m, StrategyType.m,
% TimeSeries.m and then all of your separate strategy classes 
% i.e. SimpleMA.m and Donchian.m in this example
%
% Run this example by typing 'Main' in the command window

clear classes
clc

% This class will hold the data and get passed around
% Just for demonstration - give it a name to show how we can see the
% property from each Strategy
ts = TimeSeries('abc');

s = Strategy('Donchian');
s.RunStrategy(ts);

% We can completely change all behaviour right here
s.SetStrategy('Simplema');
s.RunStrategy(ts);

%EOF