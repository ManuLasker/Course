%plotting a function
%t = [0:0.001:0.98];
%y1 = sin(2*pi*4*t);

%hold on; %seguir dibujando en la misma figura
%%plot(t, y2, 'r');
%xlabel('time')
%ylabel('value')
%legend('sin', 'cos')
%title('my plot')
%print -dpng 'myPlot.png'

%especify figures
%figure(1); 
%plot(t,y1)

%figure(2); 
%plot(t,y2)

%subplot(1,2,1);
%plot(t, y1);
% divide the figure
%subplot(1,2,2);
%plot(t, y2);

A = magic(5);
imagesc(A)
clf;