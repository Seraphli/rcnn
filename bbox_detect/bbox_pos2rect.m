%% bbox_pos2rect: Transform [x1 y1 x2 y2] to [x y w h]
function [bbox_rect] = bbox_pos2rect(bbox_pos)
	bbox_rect = zeros(size(bbox_pos));
	bbox_rect(:, [3 4]) = bbox_pos(:, [1 2]);
	bbox_rect = bbox_pos - bbox_rect;
