int BHThreshold(int[] histogram) {
    i_m = (int)((i_s + i_e) / 2.0f); // center of the weighing scale I_m
    w_l = get_weight(i_s, i_m + 1, histogram); // weight on the left W_l
    w_r = get_weight(i_m + 1, i_e + 1, histogram); // weight on the right W_r
    while (i_s <= i_e) {
        if (w_r > w_l) { // right side is heavier
            w_r -= histogram[i_e--];
            if (((i_s + i_e) / 2) < i_m) {
                w_r += histogram[i_m];
                w_l -= histogram[i_m--];
            }
        } else if (w_l >= w_r) { // left side is heavier
            w_l -= histogram[i_s++]; 
            if (((i_s + i_e) / 2) >= i_m) {
                w_l += histogram[i_m + 1];
                w_r -= histogram[i_m + 1];
                i_m++;
            }
        }
    }
    return i_m;
}