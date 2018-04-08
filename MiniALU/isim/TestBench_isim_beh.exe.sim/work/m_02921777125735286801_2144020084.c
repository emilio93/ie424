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
static const char *ng0 = "/home/emanuel/Desktop/Laboratorio-de-Digitales/Laboratorio-1/MiniALU/LUT.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {3U, 0U};



static void Always_7_0(char *t0)
{
    char t4[8];
    char t18[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 2816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(7, ng0);
    t2 = (t0 + 3384);
    *((int *)t2) = 1;
    t3 = (t0 + 2848);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(7, ng0);

LAB5:    xsi_set_current_line(8, ng0);
    t5 = (t0 + 1344U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 2);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 2);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 3U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 3U);

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t14, 2);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(9, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 1904);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 16);
    goto LAB15;

LAB9:    xsi_set_current_line(10, ng0);
    t3 = (t0 + 1184U);
    t5 = *((char **)t3);
    t3 = (t0 + 1904);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 16);
    goto LAB15;

LAB11:    xsi_set_current_line(11, ng0);
    t3 = (t0 + 1184U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng5)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_lshift(t18, 16, t5, 16, t3, 32);
    t6 = (t0 + 1904);
    xsi_vlogvar_assign_value(t6, t18, 0, 0, 16);
    goto LAB15;

LAB13:    xsi_set_current_line(12, ng0);
    t3 = (t0 + 1184U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng5)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_lshift(t18, 16, t5, 16, t3, 32);
    t6 = (t0 + 1184U);
    t7 = *((char **)t6);
    memset(t19, 0, 8);
    xsi_vlog_unsigned_add(t19, 16, t18, 16, t7, 16);
    t6 = (t0 + 1904);
    xsi_vlogvar_assign_value(t6, t19, 0, 0, 16);
    goto LAB15;

}

static void Cont_15_1(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 3064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 1904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 472);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_lshift(t7, 16, t4, 16, t6, 32);
    t5 = (t0 + 3480);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 65535U;
    t13 = t12;
    t14 = (t7 + 4);
    t15 = *((unsigned int *)t7);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t5, 0, 15);
    t20 = (t0 + 3400);
    *((int *)t20) = 1;

LAB1:    return;
}


extern void work_m_02921777125735286801_2144020084_init()
{
	static char *pe[] = {(void *)Always_7_0,(void *)Cont_15_1};
	xsi_register_didat("work_m_02921777125735286801_2144020084", "isim/TestBench_isim_beh.exe.sim/work/m_02921777125735286801_2144020084.didat");
	xsi_register_executes(pe);
}
