function dsplot(fnames,u)

defval('fnames',{'PORT-bdata30m-equal','STBD-bdata30m-equal'})
defval('u',1)

figure(gcf)
clf

for index=1:length(fnames)
  a{index} = load(fnames{index});
  c{index} = str2num(fnames{index}(11:12));
end  

diferm(c{1},c{2})

% Calculate the distance
d=sqrt([a{1}(:,1)-a{2}(:,1)].^2+[a{1}(:,2)-a{2}(:,2)].^2+[a{1}(:,3)-a{2}(:,3)].^2);

% No more loop
ah = gca;
% compute the 3d distance of these 3 points
f = mean(d);
p = plot([0:size(a{1},1)-1]*c{1},[d-f]*u);
grid on
title(sprintf('%s %s The Mean is %f',fnames{1},fnames{2},f))
 
% Cosmetics
longticks(ah)

set(p,'LineWidth',1.5)
