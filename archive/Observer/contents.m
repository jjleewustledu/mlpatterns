% This demonstrates a possibility for creating a the observer pattern in
% matlab.

%FILES:
% inverval.m - an interval with start, end and length (subject)
% interval_view.m - a plot of the interval (observer)
% interval_window.m - a dialog of the interval (observer)
% interval_window_flow.m - another dialog of the interval (observer)
% run_test_observer.m - an example script that demonstrates the use
% example.jpg - a screen dump


% The interval.m function simulates a simple class for storing an interval.
% An interval is defined by a start, end and length. It serves as a subject
% in this example.
% Observers are created with the functions interval_view.m,
% interval_window.m and interval_window_flow.m. They are attached to the
% subject by the command attatch_observer.
%
% The purpose of this example is to demonstrate a method to decouple the
% model from the control and view. It can be useful in GUI programming
% where one wants to separate the model from the view, and possible have
% multiple views of the same data. It is not easy to achieve in Matlab
% since it use by-value and not by-reference parameters in functions. Here
% it was worked around by the use of function handles.
%
% Arne Jenssen - November 2007
% Tested on matlab 7.5.0 (R2007b)
% ajj@ffi.no


