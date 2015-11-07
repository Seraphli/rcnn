function bbox =  bbox_expand(im, bbox)
    bbox = double(bbox);
    ee = 10;
	expand_size = [-ee -ee 2*ee 2*ee];
	bbox = bbox + repmat(expand_size, size(bbox, 1), 1);
	bbox(bsxfun(@lt, bbox, 1)) = 1;
	size_1 = bbox(:, 1) + bbox(:, 3);
	size_2 = bbox(:, 2) + bbox(:, 4);
	bbox(bsxfun(@gt, size_1, size(im, 2)), 3) =...
			size(im, 2) - bbox(bsxfun(@gt, size_1, size(im, 2)), 1);
	bbox(bsxfun(@gt, size_2, size(im, 1)), 4) =...
			size(im, 1) - bbox(bsxfun(@gt, size_2, size(im, 1)), 2);
end
