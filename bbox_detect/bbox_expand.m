function bbox =  bbox_expand(im, bbox)
	expand_size = [-20 -20 40 40];
	bbox = bbox + int32(repmat(expand_size, size(bbox, 1), 1));
	bbox(bsxfun(@lt, bbox, 1)) = 1;
	size_1 = bbox(:, 1) + bbox(:, 3);
	size_2 = bbox(:, 2) + bbox(:, 4);
	bbox(bsxfun(@gt, size_1, size(im, 1)), 3) =...
			size(im, 1) - bbox(bsxfun(@gt, size_1, size(im, 1)), 1);
	bbox(bsxfun(@gt, size_2, size(im, 2)), 4) =...
			size(im, 2) - bbox(bsxfun(@gt, size_2, size(im, 2)), 2);
end
