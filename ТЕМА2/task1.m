warning('off', 'all')
graphics_toolkit('gnuplot')

XX=load('dan_vuz.txt')
size(XX)

hist(Res,20)
xlabel('Results ')
ylabel('Number of Unis ')

