function boxes = selective_search_origin(im, bbox)
  th = tic();
  fast_mode = true;
  im_width = 500;
  boxes = selective_search_boxes(double(im), fast_mode, im_width);
  % compat: change coordinate order from [y1 x1 y2 x2] to [x1 y1 x2 y2]
  boxes = boxes(:, [2 1 4 3]);
  fprintf('found %d candidates (in %.3fs).\n', size(boxes,1), toc(th));
end
