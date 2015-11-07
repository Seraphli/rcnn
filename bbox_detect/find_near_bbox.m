function index = find_near_bbox(bboxes, bbox, thresh)
    index = 0;
	bbox_delta = double(bboxes) - repmat(bbox, size(bboxes, 1), 1);
	bbox_delta = abs(bbox_delta);
	[bbox_delta, ord] = sortrows(bbox_delta, [1 2]);
	if sum(bbox_delta(1, [1 2]) < thresh)
		index = ord(1);
	end
end