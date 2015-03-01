iw1 = interval_window();
iw2 = interval_window_flow();
iv = interval_view();

i1 = interval(2,8,6);
i1.attach_observer(iw1);
i1.attach_observer(iw2);
i1.attach_observer(iv);
