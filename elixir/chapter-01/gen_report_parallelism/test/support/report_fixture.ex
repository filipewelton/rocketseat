defmodule GenReportParellelism.ReportFixture do
  def build do
    %{
      all_hours: %{
        "Cleiton" => 4497,
        "Daniele" => 4428,
        "Danilo" => 4722,
        "Diego" => 4401,
        "Giuliano" => 4473,
        "Jakeliny" => 4656,
        "Joseph" => 4219,
        "Mayk" => 4404,
        "Rafael" => 4388,
        "Vinicius" => 4587
      },
      hours_per_month: %{
        "Cleiton" => %{
          "abril" => 346,
          "agosto" => 391,
          "dezembro" => 339,
          "fevereiro" => 385,
          "janeiro" => 376,
          "julho" => 355,
          "junho" => 392,
          "maio" => 410,
          "março" => 295,
          "novembro" => 374,
          "outubro" => 396,
          "setembro" => 438
        },
        "Daniele" => %{
          "abril" => 401,
          "agosto" => 343,
          "dezembro" => 342,
          "fevereiro" => 331,
          "janeiro" => 398,
          "julho" => 416,
          "junho" => 406,
          "maio" => 369,
          "março" => 427,
          "novembro" => 315,
          "outubro" => 319,
          "setembro" => 361
        },
        "Danilo" => %{
          "abril" => 463,
          "agosto" => 403,
          "dezembro" => 310,
          "fevereiro" => 428,
          "janeiro" => 348,
          "julho" => 399,
          "junho" => 317,
          "maio" => 458,
          "março" => 376,
          "novembro" => 362,
          "outubro" => 468,
          "setembro" => 390
        },
        "Diego" => %{
          "abril" => 398,
          "agosto" => 410,
          "dezembro" => 462,
          "fevereiro" => 322,
          "janeiro" => 353,
          "julho" => 383,
          "junho" => 317,
          "maio" => 355,
          "março" => 384,
          "novembro" => 324,
          "outubro" => 306,
          "setembro" => 387
        },
        "Giuliano" => %{
          "abril" => 431,
          "agosto" => 333,
          "dezembro" => 327,
          "fevereiro" => 380,
          "janeiro" => 378,
          "julho" => 375,
          "junho" => 411,
          "maio" => 417,
          "março" => 290,
          "novembro" => 368,
          "outubro" => 388,
          "setembro" => 375
        },
        "Jakeliny" => %{
          "abril" => 406,
          "agosto" => 333,
          "dezembro" => 385,
          "fevereiro" => 425,
          "janeiro" => 461,
          "julho" => 397,
          "junho" => 366,
          "maio" => 338,
          "março" => 406,
          "novembro" => 321,
          "outubro" => 414,
          "setembro" => 404
        },
        "Joseph" => %{
          "abril" => 301,
          "agosto" => 418,
          "dezembro" => 382,
          "fevereiro" => 327,
          "janeiro" => 339,
          "julho" => 388,
          "junho" => 367,
          "maio" => 351,
          "março" => 309,
          "novembro" => 300,
          "outubro" => 357,
          "setembro" => 380
        },
        "Mayk" => %{
          "abril" => 355,
          "agosto" => 356,
          "dezembro" => 406,
          "fevereiro" => 434,
          "janeiro" => 335,
          "julho" => 377,
          "junho" => 396,
          "maio" => 345,
          "março" => 306,
          "novembro" => 433,
          "outubro" => 304,
          "setembro" => 357
        },
        "Rafael" => %{
          "abril" => 348,
          "agosto" => 418,
          "dezembro" => 296,
          "fevereiro" => 293,
          "janeiro" => 351,
          "julho" => 272,
          "junho" => 460,
          "maio" => 463,
          "março" => 434,
          "novembro" => 320,
          "outubro" => 358,
          "setembro" => 375
        },
        "Vinicius" => %{
          "abril" => 371,
          "agosto" => 322,
          "dezembro" => 458,
          "fevereiro" => 408,
          "janeiro" => 403,
          "julho" => 433,
          "junho" => 407,
          "maio" => 357,
          "março" => 375,
          "novembro" => 332,
          "outubro" => 335,
          "setembro" => 386
        }
      },
      hours_per_year: %{
        "Cleiton" => %{
          "2016" => 852,
          "2017" => 825,
          "2018" => 924,
          "2019" => 906,
          "2020" => 990
        },
        "Daniele" => %{
          "2016" => 986,
          "2017" => 903,
          "2018" => 880,
          "2019" => 773,
          "2020" => 886
        },
        "Danilo" => %{
          "2016" => 872,
          "2017" => 1048,
          "2018" => 1064,
          "2019" => 987,
          "2020" => 751
        },
        "Diego" => %{
          "2016" => 930,
          "2017" => 926,
          "2018" => 906,
          "2019" => 791,
          "2020" => 848
        },
        "Giuliano" => %{
          "2016" => 895,
          "2017" => 948,
          "2018" => 774,
          "2019" => 1004,
          "2020" => 852
        },
        "Jakeliny" => %{
          "2016" => 1011,
          "2017" => 958,
          "2018" => 880,
          "2019" => 877,
          "2020" => 930
        },
        "Joseph" => %{
          "2016" => 871,
          "2017" => 904,
          "2018" => 743,
          "2019" => 809,
          "2020" => 892
        },
        "Mayk" => %{
          "2016" => 826,
          "2017" => 755,
          "2018" => 1038,
          "2019" => 1016,
          "2020" => 769
        },
        "Rafael" => %{
          "2016" => 873,
          "2017" => 759,
          "2018" => 838,
          "2019" => 905,
          "2020" => 1013
        },
        "Vinicius" => %{
          "2016" => 895,
          "2017" => 865,
          "2018" => 939,
          "2019" => 946,
          "2020" => 942
        }
      }
    }
  end
end
