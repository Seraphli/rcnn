function bbox =  bbox_expand(im, bbox)
	expand_size = [-20 -20 40 40];
    bbox = bbox + int32(repmat(expand_size, size(bbox, 1), 1));
    bbox(bsxfun(@lt, bbox, 1)) = 1;
    bbox(bsxfun(@gt, bbox(:, [1, 3]), size(im, 1))) = size(im, 1);
    bbox(bsxfun(@gt, bbox(:, [2, 4]), size(im, 2))) = size(im, 2);
end
