const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#050104", /* black   */
  [1] = "#a73335", /* red     */
  [2] = "#2d6c89", /* green   */
  [3] = "#3a6fb3", /* yellow  */
  [4] = "#4a87b2", /* blue    */
  [5] = "#43aec0", /* magenta */
  [6] = "#6690bc", /* cyan    */
  [7] = "#ccd5dc", /* white   */

  /* 8 bright colors */
  [8]  = "#8e959a",  /* black   */
  [9]  = "#b53335",  /* red     */
  [10] = "#277396", /* green   */
  [11] = "#326ebb", /* yellow  */
  [12] = "#5195c5", /* blue    */
  [13] = "#39b9ce", /* magenta */
  [14] = "#6f9ecf", /* cyan    */
  [15] = "#ccd5dc", /* white   */

  /* special colors */
  [256] = "#050104", /* background */
  [257] = "#ccd5dc", /* foreground */
  [258] = "#ccd5dc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
