if(EXISTS "/home/rodrigo/Desktop/CES12/lab4/labParadigm200609_1451/build/labTrocotests[1]_tests.cmake")
  include("/home/rodrigo/Desktop/CES12/lab4/labParadigm200609_1451/build/labTrocotests[1]_tests.cmake")
else()
  add_test(labTrocotests_NOT_BUILT labTrocotests_NOT_BUILT)
endif()
