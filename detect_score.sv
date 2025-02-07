module detect_score(g0,g7,count);
  input g0,g7;
  output count;
  
  assign count = (g0|g7);

endmodule