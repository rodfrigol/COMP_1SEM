if(EXISTS "/home/rodrigo/Desktop/CES12/lab4/labParadigm200609_1451/build/labSSPtests[1]_tests.cmake")
  include("/home/rodrigo/Desktop/CES12/lab4/labParadigm200609_1451/build/labSSPtests[1]_tests.cmake")
else()
  add_test(labSSPtests_NOT_BUILT labSSPtests_NOT_BUILT)
endif()