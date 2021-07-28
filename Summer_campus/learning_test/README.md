同步FIFO
一、模块组成：1.双端RAM（FIFO_Memory）；2.读指针（rd_ptr）;3.写指针（wr_ptr）；4.状态控制（status_control）
二、端口名以及类型：1.双端RAM（wr_data[8bits*];rd_data[8bits*];clk;wr_addr[8bits*];rd_addr[8bits*];wr_fifo-write avaliable signal;rd_fifo-read available signal）
		2.wr_ptr(clk;wr_addr;wr_fifo);rd_ptr(clk;rd_addr;rd_fifo)
		3.status control(clk;wr_ptr/wr_addr;rd_ptr/rd_addr;valid_wr;valid_rd;wr_en;rd_en;fifo_full;fifo_empty;fifo_count?)