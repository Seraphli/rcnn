%% bbox_rect2pos: Transform [x y w h] to [x1 y1 x2 y2]
function [bbox_pos] = bbox_rect2pos(bbox_rect)
	bbox_pos = zeros(size(bbox_rect));
	bbox_pos(:, [3 4]) = bbox_rect(:, [1 2]);
	bbox_pos = bbox_pos + bbox_rect;
