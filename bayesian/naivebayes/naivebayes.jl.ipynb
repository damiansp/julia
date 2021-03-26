{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "compliant-opera",
   "metadata": {},
   "outputs": [],
   "source": [
    "using CSV\n",
    "using DataFrames\n",
    "using Images\n",
    "using Languages\n",
    "using MLDataUtils\n",
    "using Plots\n",
    "using TextAnalysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "instructional-meeting",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\"../../data\""
      ]
     },
     "execution_count": 2,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "DATA = \"../../data\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "federal-preliminary",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"data-frame\"><thead><tr><th></th><th>Email No.</th><th>the</th><th>to</th><th>ect</th><th>and</th><th>for</th><th>of</th><th>a</th><th>you</th><th>hou</th><th>in</th></tr><tr><th></th><th>String</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th><th>Int64</th></tr></thead><tbody><p>5,172 rows × 3,002 columns (omitted printing of 2991 columns)</p><tr><th>1</th><td>Email 1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td></tr><tr><th>2</th><td>Email 2</td><td>8</td><td>13</td><td>24</td><td>6</td><td>6</td><td>2</td><td>102</td><td>1</td><td>27</td><td>18</td></tr><tr><th>3</th><td>Email 3</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>8</td><td>0</td><td>0</td><td>4</td></tr><tr><th>4</th><td>Email 4</td><td>0</td><td>5</td><td>22</td><td>0</td><td>5</td><td>1</td><td>51</td><td>2</td><td>10</td><td>1</td></tr><tr><th>5</th><td>Email 5</td><td>7</td><td>6</td><td>17</td><td>1</td><td>5</td><td>2</td><td>57</td><td>0</td><td>9</td><td>3</td></tr><tr><th>6</th><td>Email 6</td><td>4</td><td>5</td><td>1</td><td>4</td><td>2</td><td>3</td><td>45</td><td>1</td><td>0</td><td>16</td></tr><tr><th>7</th><td>Email 7</td><td>5</td><td>3</td><td>1</td><td>3</td><td>2</td><td>1</td><td>37</td><td>0</td><td>0</td><td>9</td></tr><tr><th>8</th><td>Email 8</td><td>0</td><td>2</td><td>2</td><td>3</td><td>1</td><td>2</td><td>21</td><td>6</td><td>0</td><td>2</td></tr><tr><th>9</th><td>Email 9</td><td>2</td><td>2</td><td>3</td><td>0</td><td>0</td><td>1</td><td>18</td><td>0</td><td>0</td><td>3</td></tr><tr><th>10</th><td>Email 10</td><td>4</td><td>4</td><td>35</td><td>0</td><td>1</td><td>0</td><td>49</td><td>1</td><td>16</td><td>9</td></tr><tr><th>11</th><td>Email 11</td><td>22</td><td>14</td><td>2</td><td>9</td><td>2</td><td>2</td><td>104</td><td>0</td><td>2</td><td>35</td></tr><tr><th>12</th><td>Email 12</td><td>33</td><td>28</td><td>27</td><td>11</td><td>10</td><td>12</td><td>173</td><td>6</td><td>12</td><td>28</td></tr><tr><th>13</th><td>Email 13</td><td>27</td><td>17</td><td>3</td><td>7</td><td>5</td><td>8</td><td>106</td><td>3</td><td>0</td><td>22</td></tr><tr><th>14</th><td>Email 14</td><td>4</td><td>5</td><td>7</td><td>1</td><td>5</td><td>1</td><td>37</td><td>1</td><td>3</td><td>8</td></tr><tr><th>15</th><td>Email 15</td><td>2</td><td>4</td><td>6</td><td>0</td><td>3</td><td>1</td><td>16</td><td>0</td><td>3</td><td>6</td></tr><tr><th>16</th><td>Email 16</td><td>6</td><td>2</td><td>1</td><td>0</td><td>2</td><td>0</td><td>36</td><td>3</td><td>1</td><td>8</td></tr><tr><th>17</th><td>Email 17</td><td>3</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>17</td><td>0</td><td>0</td><td>1</td></tr><tr><th>18</th><td>Email 18</td><td>36</td><td>21</td><td>6</td><td>14</td><td>7</td><td>17</td><td>194</td><td>25</td><td>5</td><td>59</td></tr><tr><th>19</th><td>Email 19</td><td>1</td><td>3</td><td>1</td><td>0</td><td>2</td><td>0</td><td>14</td><td>0</td><td>0</td><td>1</td></tr><tr><th>20</th><td>Email 20</td><td>3</td><td>4</td><td>11</td><td>0</td><td>4</td><td>2</td><td>32</td><td>1</td><td>5</td><td>1</td></tr><tr><th>21</th><td>Email 21</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>15</td><td>1</td><td>0</td><td>2</td></tr><tr><th>22</th><td>Email 22</td><td>5</td><td>1</td><td>13</td><td>2</td><td>3</td><td>1</td><td>36</td><td>2</td><td>5</td><td>5</td></tr><tr><th>23</th><td>Email 23</td><td>0</td><td>3</td><td>6</td><td>0</td><td>5</td><td>0</td><td>30</td><td>0</td><td>2</td><td>6</td></tr><tr><th>24</th><td>Email 24</td><td>4</td><td>0</td><td>1</td><td>0</td><td>2</td><td>1</td><td>15</td><td>1</td><td>0</td><td>8</td></tr><tr><th>25</th><td>Email 25</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td><td>0</td><td>10</td><td>0</td><td>0</td><td>1</td></tr><tr><th>26</th><td>Email 26</td><td>12</td><td>53</td><td>2</td><td>14</td><td>18</td><td>14</td><td>287</td><td>0</td><td>2</td><td>86</td></tr><tr><th>27</th><td>Email 27</td><td>5</td><td>4</td><td>1</td><td>1</td><td>4</td><td>4</td><td>51</td><td>0</td><td>1</td><td>8</td></tr><tr><th>28</th><td>Email 28</td><td>1</td><td>1</td><td>2</td><td>0</td><td>1</td><td>0</td><td>14</td><td>1</td><td>0</td><td>0</td></tr><tr><th>29</th><td>Email 29</td><td>18</td><td>14</td><td>2</td><td>3</td><td>1</td><td>5</td><td>87</td><td>3</td><td>1</td><td>16</td></tr><tr><th>30</th><td>Email 30</td><td>9</td><td>11</td><td>47</td><td>2</td><td>3</td><td>11</td><td>83</td><td>2</td><td>22</td><td>12</td></tr><tr><th>&vellip;</th><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td></tr></tbody></table>"
      ],
      "text/latex": [
       "\\begin{tabular}{r|cccccccccccc}\n",
       "\t& Email No. & the & to & ect & and & for & of & a & you & hou & in & \\\\\n",
       "\t\\hline\n",
       "\t& String & Int64 & Int64 & Int64 & Int64 & Int64 & Int64 & Int64 & Int64 & Int64 & Int64 & \\\\\n",
       "\t\\hline\n",
       "\t1 & Email 1 & 0 & 0 & 1 & 0 & 0 & 0 & 2 & 0 & 0 & 0 & $\\dots$ \\\\\n",
       "\t2 & Email 2 & 8 & 13 & 24 & 6 & 6 & 2 & 102 & 1 & 27 & 18 & $\\dots$ \\\\\n",
       "\t3 & Email 3 & 0 & 0 & 1 & 0 & 0 & 0 & 8 & 0 & 0 & 4 & $\\dots$ \\\\\n",
       "\t4 & Email 4 & 0 & 5 & 22 & 0 & 5 & 1 & 51 & 2 & 10 & 1 & $\\dots$ \\\\\n",
       "\t5 & Email 5 & 7 & 6 & 17 & 1 & 5 & 2 & 57 & 0 & 9 & 3 & $\\dots$ \\\\\n",
       "\t6 & Email 6 & 4 & 5 & 1 & 4 & 2 & 3 & 45 & 1 & 0 & 16 & $\\dots$ \\\\\n",
       "\t7 & Email 7 & 5 & 3 & 1 & 3 & 2 & 1 & 37 & 0 & 0 & 9 & $\\dots$ \\\\\n",
       "\t8 & Email 8 & 0 & 2 & 2 & 3 & 1 & 2 & 21 & 6 & 0 & 2 & $\\dots$ \\\\\n",
       "\t9 & Email 9 & 2 & 2 & 3 & 0 & 0 & 1 & 18 & 0 & 0 & 3 & $\\dots$ \\\\\n",
       "\t10 & Email 10 & 4 & 4 & 35 & 0 & 1 & 0 & 49 & 1 & 16 & 9 & $\\dots$ \\\\\n",
       "\t11 & Email 11 & 22 & 14 & 2 & 9 & 2 & 2 & 104 & 0 & 2 & 35 & $\\dots$ \\\\\n",
       "\t12 & Email 12 & 33 & 28 & 27 & 11 & 10 & 12 & 173 & 6 & 12 & 28 & $\\dots$ \\\\\n",
       "\t13 & Email 13 & 27 & 17 & 3 & 7 & 5 & 8 & 106 & 3 & 0 & 22 & $\\dots$ \\\\\n",
       "\t14 & Email 14 & 4 & 5 & 7 & 1 & 5 & 1 & 37 & 1 & 3 & 8 & $\\dots$ \\\\\n",
       "\t15 & Email 15 & 2 & 4 & 6 & 0 & 3 & 1 & 16 & 0 & 3 & 6 & $\\dots$ \\\\\n",
       "\t16 & Email 16 & 6 & 2 & 1 & 0 & 2 & 0 & 36 & 3 & 1 & 8 & $\\dots$ \\\\\n",
       "\t17 & Email 17 & 3 & 1 & 2 & 2 & 0 & 1 & 17 & 0 & 0 & 1 & $\\dots$ \\\\\n",
       "\t18 & Email 18 & 36 & 21 & 6 & 14 & 7 & 17 & 194 & 25 & 5 & 59 & $\\dots$ \\\\\n",
       "\t19 & Email 19 & 1 & 3 & 1 & 0 & 2 & 0 & 14 & 0 & 0 & 1 & $\\dots$ \\\\\n",
       "\t20 & Email 20 & 3 & 4 & 11 & 0 & 4 & 2 & 32 & 1 & 5 & 1 & $\\dots$ \\\\\n",
       "\t21 & Email 21 & 0 & 0 & 1 & 1 & 0 & 0 & 15 & 1 & 0 & 2 & $\\dots$ \\\\\n",
       "\t22 & Email 22 & 5 & 1 & 13 & 2 & 3 & 1 & 36 & 2 & 5 & 5 & $\\dots$ \\\\\n",
       "\t23 & Email 23 & 0 & 3 & 6 & 0 & 5 & 0 & 30 & 0 & 2 & 6 & $\\dots$ \\\\\n",
       "\t24 & Email 24 & 4 & 0 & 1 & 0 & 2 & 1 & 15 & 1 & 0 & 8 & $\\dots$ \\\\\n",
       "\t25 & Email 25 & 0 & 0 & 1 & 0 & 4 & 0 & 10 & 0 & 0 & 1 & $\\dots$ \\\\\n",
       "\t26 & Email 26 & 12 & 53 & 2 & 14 & 18 & 14 & 287 & 0 & 2 & 86 & $\\dots$ \\\\\n",
       "\t27 & Email 27 & 5 & 4 & 1 & 1 & 4 & 4 & 51 & 0 & 1 & 8 & $\\dots$ \\\\\n",
       "\t28 & Email 28 & 1 & 1 & 2 & 0 & 1 & 0 & 14 & 1 & 0 & 0 & $\\dots$ \\\\\n",
       "\t29 & Email 29 & 18 & 14 & 2 & 3 & 1 & 5 & 87 & 3 & 1 & 16 & $\\dots$ \\\\\n",
       "\t30 & Email 30 & 9 & 11 & 47 & 2 & 3 & 11 & 83 & 2 & 22 & 12 & $\\dots$ \\\\\n",
       "\t$\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ & $\\dots$ &  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/plain": [
       "\u001b[1m5172×3002 DataFrame\u001b[0m\n",
       "\u001b[1m  Row \u001b[0m│\u001b[1m Email No.  \u001b[0m\u001b[1m the   \u001b[0m\u001b[1m to    \u001b[0m\u001b[1m ect   \u001b[0m\u001b[1m and   \u001b[0m\u001b[1m for   \u001b[0m\u001b[1m of    \u001b[0m\u001b[1m a     \u001b[0m\u001b[1m you   \u001b[0m\u001b[1m ho\u001b[0m ⋯\n",
       "\u001b[1m      \u001b[0m│\u001b[90m String     \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m Int64 \u001b[0m\u001b[90m In\u001b[0m ⋯\n",
       "──────┼─────────────────────────────────────────────────────────────────────────\n",
       "    1 │ Email 1         0      0      1      0      0      0      2  0      0  ⋯\n",
       "    2 │ Email 2         8     13     24      6      6      2    102  1      27\n",
       "    3 │ Email 3         0      0      1      0      0      0      8  0      0\n",
       "    4 │ Email 4         0      5     22      0      5      1     51  2      10\n",
       "    5 │ Email 5         7      6     17      1      5      2     57  0      9  ⋯\n",
       "    6 │ Email 6         4      5      1      4      2      3     45  1      0\n",
       "    7 │ Email 7         5      3      1      3      2      1     37  0      0\n",
       "    8 │ Email 8         0      2      2      3      1      2     21  6      0\n",
       "    9 │ Email 9         2      2      3      0      0      1     18  0      0  ⋯\n",
       "   10 │ Email 10        4      4     35      0      1      0     49  1      16\n",
       "   11 │ Email 11       22     14      2      9      2      2    104  0      2\n",
       "  ⋮   │     ⋮         ⋮      ⋮      ⋮      ⋮      ⋮      ⋮      ⋮      ⋮       ⋱\n",
       " 5163 │ Email 5163      2      3      1      2      1      2     32  0      0\n",
       " 5164 │ Email 5164      0      0      1      0      0      0      1  0      0  ⋯\n",
       " 5165 │ Email 5165     21     18      3      1      6      4    106  1      2\n",
       " 5166 │ Email 5166      1      0      1      0      3      1     12  1      0\n",
       " 5167 │ Email 5167      1      0      1      1      0      0      4  0      0\n",
       " 5168 │ Email 5168      2      2      2      3      0      0     32  0      0  ⋯\n",
       " 5169 │ Email 5169     35     27     11      2      6      5    151  4      3\n",
       " 5170 │ Email 5170      0      0      1      1      0      0     11  0      0\n",
       " 5171 │ Email 5171      2      7      1      0      2      1     28  2      0\n",
       " 5172 │ Email 5172     22     24      5      1      6      5    148  8      2  ⋯\n",
       "\u001b[36m                                              2993 columns and 5151 rows omitted\u001b[0m"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "df = DataFrame(CSV.File(\"$DATA/emails.csv\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "fixed-continent",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "10-element Array{String,1}:\n",
       " \"the\"\n",
       " \"to\"\n",
       " \"ect\"\n",
       " \"and\"\n",
       " \"for\"\n",
       " \"of\"\n",
       " \"a\"\n",
       " \"you\"\n",
       " \"hou\"\n",
       " \"in\""
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "allwords = names(df)[2:end - 1]\n",
    "allwords[1:10]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "suitable-sherman",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\"[\\\"one \\\", \\\"two \\\"]\""
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "string([string(\"one\", \" \"), string(\"two\", \" \")])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "exclusive-tours",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "A StringDocument{String}\n",
       " * Language: Languages.English()\n",
       " * Title: Untitled Document\n",
       " * Author: Unknown Author\n",
       " * Timestamp: Unknown Time\n",
       " * Snippet: the to ect and for of a you hou in on is this enro"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "allwordstext = StringDocument(\n",
    "    string([string(word, \" \") for word in allwords]...))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "aerial-enzyme",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "2975×5172 LinearAlgebra.Adjoint{Int64,Array{Int64,2}}:\n",
       " 0  13  0   5   6   5   3   2   2   4  …   3  0  18  0  0   2  27   0   7  24\n",
       " 1  24  1  22  17   1   1   2   3  35      1  1   3  1  1   2  11   1   1   5\n",
       " 0   6  0   0   1   4   3   3   0   0      2  0   1  0  1   3   2   1   0   1\n",
       " 0   6  0   5   5   2   2   1   0   1      1  0   6  3  0   0   6   0   2   6\n",
       " 0   2  0   1   2   3   1   2   1   0      2  0   4  1  0   0   5   0   1   5\n",
       " 0  27  0  10   9   0   0   0   0  16  …   0  0   2  0  0   0   3   0   0   2\n",
       " 0  18  4   1   3  16   9   2   3   9      7  0  18  2  0   5  23   1   8  23\n",
       " 0  21  2   5  12  12   4   6   3   4      3  0  11  2  0   6  18   1  11  13\n",
       " 1  13  0   9   2   8   6   2   2   1      2  0   4  1  1   1   6   3   7   5\n",
       " 0   0  0   2   2   1   2   0   1   0      0  0   3  0  0   0   3   1   1   4\n",
       " 0   1  0   0   0   0   0   0   0   0  …   0  0   1  0  0   0   1   0   0   1\n",
       " 2  61  8  16  30  52  27  28  15  35     26  1  70  7  1  20  98  10  39  99\n",
       " 0   4  0   2   8   2   1   1   0  10      3  0   6  0  0   1  10   0   1   6\n",
       " ⋮                  ⋮                  ⋱             ⋮                  ⋮  \n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0  …   0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  1  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0  …   0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0\n",
       " 0   1  0   0   1   0   0   1   0   0      0  0   0  0  0   0   1   0   1   0\n",
       " 0   0  0   0   0   0   0   0   0   0      0  0   0  0  0   0   0   0   0   0"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "prepare!(allwordstext, strip_articles)\n",
    "prepare!(allwordstext, strip_pronouns)\n",
    "vocab = filter(x -> x != \"\", split(TextAnalysis.text(allwordstext)))\n",
    "cleanwords_df = df[!, vocab]\n",
    "datamatrix = Matrix(cleanwords_df)'"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "impressive-spectacular",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "5172-element Array{Int64,1}:\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " ⋮\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 1\n",
       " 0"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "labels = df.Prediction"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "adolescent-ancient",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(([28 0 … 1 9; 13 1 … 1 7; … ; 0 0 … 0 0; 0 0 … 0 0], [0, 0, 0, 1, 1, 0, 0, 0, 0, 0  …  0, 1, 0, 0, 0, 0, 1, 1, 0, 0]), ([0 3 … 4 2; 1 1 … 1 1; … ; 0 0 … 0 0; 0 0 … 0 0], [0, 0, 0, 0, 1, 0, 0, 0, 0, 1  …  1, 0, 0, 0, 0, 1, 0, 0, 1, 1]))"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "(Xtrain, ytrain), (Xtest, ytest) = splitobs(\n",
    "    shuffleobs((datamatrix, labels)), at=0.7)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "respected-senate",
   "metadata": {},
   "outputs": [],
   "source": [
    "mutable struct BayesSpamFilter\n",
    "    wordcountham::Dict{String, Int64}\n",
    "    wordcountspam::Dict{String, Int64}\n",
    "    nham::Int64\n",
    "    nspam::Int64\n",
    "    vocab::Array{String}\n",
    "    BayesSpamFilter() = new()\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "emotional-arcade",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "countwords (generic function with 2 methods)"
      ]
     },
     "execution_count": 11,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function countwords(worddata, vocab, labels, spam=0)\n",
    "    # worddata is a matrix where each col is an email and each row a word\n",
    "    countdict = Dict{String, Int64}()\n",
    "    nemails = size(worddata)[2]\n",
    "    for (i, word) in enumerate(vocab)\n",
    "        countdict[word] = sum(\n",
    "            [worddata[i, j] for j in 1:nemails if labels[j] == spam])\n",
    "    end\n",
    "    countdict\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "beneficial-webster",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "fit! (generic function with 1 method)"
      ]
     },
     "execution_count": 12,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function fit!(model::BayesSpamFilter, Xtrain, ytrain, vocab)\n",
    "    model.vocab = vocab\n",
    "    model.wordcountham = countwords(Xtrain, model.vocab, ytrain, 0)\n",
    "    model.wordcountspam = countwords(Xtrain, model.vocab, ytrain, 1)\n",
    "    model.nham = sum(values(model.wordcountham))\n",
    "    model.nspam = sum(values(model.wordcountspam))\n",
    "    return\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "dense-uzbekistan",
   "metadata": {},
   "outputs": [],
   "source": [
    "spamfilter = BayesSpamFilter()\n",
    "fit!(spamfilter, Xtrain, ytrain, vocab)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "returning-primary",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "get_hamspamprob (generic function with 1 method)"
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function get_hamspamprob(\n",
    "        word, wordcountham, wordcountspam, nham, nspam, nvocab, alpha)\n",
    "    hamprob = (wordcountham[word] + alpha) / (nham + alpha*nvocab)\n",
    "    spamprob = (wordcountspam[word] + alpha) / (nspam + alpha*nvocab)\n",
    "    hamprob, spamprob\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "prescribed-cornell",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "predictspam (generic function with 2 methods)"
      ]
     },
     "execution_count": 15,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function predictspam(email, model::BayesSpamFilter, alpha, tol=100)\n",
    "    ngrams_email = ngrams(StringDocument(email))\n",
    "    emailwords = keys(ngrams_email)\n",
    "    nvocab = length(model.vocab)\n",
    "    mod_nemail = model.nham + model.nspam\n",
    "    hamprior = model.nham / mod_nemail\n",
    "    spamprior = model.nspam / mod_nemail\n",
    "    if length(emailwords) > tol\n",
    "        wordfreq = values(ngrams_email)\n",
    "        sortidx = sortperm(collect(wordfreq), rev=true)\n",
    "        emailwords = collect(emailwords)[sortidx][1:tol]\n",
    "    end\n",
    "    email_hamprob = BigFloat(1)\n",
    "    email_spamprob = BigFloat(1)\n",
    "    for word in [w for w in emailwords if w in vocab]\n",
    "        wordhamprob, wordspamprob = get_hamspamprob(\n",
    "            word, \n",
    "            model.wordcountham, \n",
    "            model.wordcountspam, \n",
    "            model.nham, \n",
    "            model.nspam, \n",
    "            nvocab, \n",
    "            alpha)\n",
    "        email_hamprob *= wordhamprob\n",
    "        email_spamprob *= wordspamprob\n",
    "    end\n",
    "    hamprior * email_hamprob, spamprior * email_spamprob\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "distant-monday",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(7.612196036286371686157307601478590097076861352724625343689551930290735948990174e-266, 3.275192062948620881986327872137621264910945583564581195438458389853483548341178e-297)"
      ]
     },
     "execution_count": 16,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# Test\n",
    "TEST_EMAIL = 56\n",
    "email = string(\n",
    "    [repeat(string(word, \" \"), n) \n",
    "     for (word, n) in zip(vocab, Xtest[:, TEST_EMAIL])]...)\n",
    "hamprob, spamprob = predictspam(email, spamfilter, 1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "electoral-favorite",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "1"
      ]
     },
     "execution_count": 17,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "argmax([hamprob, spamprob]) # ham"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "better-miller",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0"
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "ytest[TEST_EMAIL] # 1 = spam"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "spectacular-philip",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "predictall (generic function with 3 methods)"
      ]
     },
     "execution_count": 27,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function predictall(Xtest, ytest, model::BayesSpamFilter, alpha, tol=200)\n",
    "    n = length(ytest)\n",
    "    preds = Array{Int64, 1}(undef, n)\n",
    "    for i in 1:n\n",
    "        email = string(\n",
    "            [repeat(string(word, \" \"), n)\n",
    "             for (word, n) in zip(model.vocab, Xtest[:, i])]...)\n",
    "        pham, pspam = predictspam(email, model, alpha, tol)\n",
    "        pred = argmax([pham, pspam]) - 1\n",
    "        preds[i] = pred\n",
    "    end\n",
    "    preds\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "recent-grade",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "1552-element Array{Int64,1}:\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 1\n",
       " 1\n",
       " ⋮\n",
       " 1\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 0\n",
       " 0\n",
       " 1\n",
       " 1"
      ]
     },
     "execution_count": 28,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "preds = predictall(Xtest, ytest, spamfilter, 1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "stainless-yield",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "get_accuracy (generic function with 3 methods)"
      ]
     },
     "execution_count": 32,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "function get_accuracy(preds, actual)\n",
    "    n = length(preds)\n",
    "    correct = sum(preds .== actual)\n",
    "    accuracy = correct / n\n",
    "    accuracy\n",
    "end"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "roman-participation",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0.9458762886597938"
      ]
     },
     "execution_count": 33,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "get_accuracy(preds, ytest)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "secret-basics",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Julia 1.5.3",
   "language": "julia",
   "name": "julia-1.5"
  },
  "language_info": {
   "file_extension": ".jl",
   "mimetype": "application/julia",
   "name": "julia",
   "version": "1.5.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
