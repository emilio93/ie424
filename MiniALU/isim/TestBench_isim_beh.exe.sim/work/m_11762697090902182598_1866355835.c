/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/emanuel/Desktop/Laboratorio-de-Digitales/Laboratorio-1/minialu/Mul2LUT.v";



static void Cont_16_0(char *t0)
{
    char t5[8];
    char t7[8];
    char t9[8];
    char t11[8];
    char t13[8];
    char t15[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t10;
    char *t12;
    char *t14;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;

LAB0:    t1 = (t0 + 3800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    xsi_vlog_unsigned_add(t5, 16, t3, 16, t4, 16);
    t2 = (t0 + 1848U);
    t6 = *((char **)t2);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 16, t5, 16, t6, 16);
    t2 = (t0 + 2008U);
    t8 = *((char **)t2);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 16, t7, 16, t8, 16);
    t2 = (t0 + 2168U);
    t10 = *((char **)t2);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 16, t9, 16, t10, 16);
    t2 = (t0 + 2328U);
    t12 = *((char **)t2);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 16, t11, 16, t12, 16);
    t2 = (t0 + 2488U);
    t14 = *((char **)t2);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 16, t13, 16, t14, 16);
    t2 = (t0 + 2648U);
    t16 = *((char **)t2);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 16, t15, 16, t16, 16);
    t2 = (t0 + 4200);
    t18 = (t2 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t21, 0, 8);
    t22 = 65535U;
    t23 = t22;
    t24 = (t17 + 4);
    t25 = *((unsigned int *)t17);
    t22 = (t22 & t25);
    t26 = *((unsigned int *)t24);
    t23 = (t23 & t26);
    t27 = (t21 + 4);
    t28 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t28 | t22);
    t29 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t29 | t23);
    xsi_driver_vfirst_trans(t2, 0, 15);
    t30 = (t0 + 4120);
    *((int *)t30) = 1;

LAB1:    return;
}


extern void work_m_11762697090902182598_1866355835_init()
{
	static char *pe[] = {(void *)Cont_16_0};
	xsi_register_didat("work_m_11762697090902182598_1866355835", "isim/TestBench_isim_beh.exe.sim/work/m_11762697090902182598_1866355835.didat");
	xsi_register_executes(pe);
}
