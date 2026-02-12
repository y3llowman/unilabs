pkg load statistics

MM = normrnd(10, 8, [5, 7])
SR = mean(MM, 'all')

MM(MM > SR + 8) = SR + 8
MM(MM < SR - 8) = SR -8

MMC = MM(:)
MMC = sort(MMC, 'ascend')

n = length(MMC)
if mod(n, 2) == 0:
  median = (MMC(n/2) + MMC(n/2+1)) / 2
else:
  median = MMC((n+1)/2)

MM1 = log(MM)
