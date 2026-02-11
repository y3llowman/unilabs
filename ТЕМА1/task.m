pkg load statistics

MM = normrnd(10, 8, [5, 7])
SR = mean(MM, 'all')
SR = SR + 8
more = MM > SR
less = MM < SR

MM(more) = more
MM(less) = less

MMC = MM(:)
MMC = sort(MMC, 'ascend')

n = length(MMC)
if mod(n, 2) == 0:
  median = (MMC(n/2) + MMC(n/2+1)) / 2
else:
  median = MMC((n+1)/2)

MM1 = log(MM)
