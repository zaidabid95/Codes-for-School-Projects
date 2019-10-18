openfig('figures.fig');
hold on
rfr = 0.0619;
x_axis = 0:0.1:0.3;
for i = 1.485
    sml_i = rfr + (i.*x_axis);
    plot(x_axis,sml_i,'g-')
end

%plots the sml for the efficient frontier