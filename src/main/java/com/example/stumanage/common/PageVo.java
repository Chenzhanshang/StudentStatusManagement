
package com.example.stumanage.common;

/**
 * Created by zhangzengke on 2018/2/10.
 */
public class PageVo {
    private Integer pageSize = 10;
    private Integer page = 1;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
