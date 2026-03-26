HTMLWidgets.widget({

  name: 'fillGaps',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        // --------------- Get questions from R function and all other variables --------

        const quizCloze = x.convCloze;
        const quizAnswers = x.convAnswers;
        const quizOptions = x.convOptions;

        // Get ID from htmlwidget container
        const widgetId = document.getElementById(el.id).id;

        // Get title and description
        const title = x.title;
        const descript = x.descript;

        // Get element options
        const language = x.language;
        const showTipBtn = x.showTipBtn;
        const showSolutionBtn = x.showSolutionBtn;
        const txtSubmitBtn = x.txtSubmitBtn;
        const txtTipBtnShow = x.txtTipBtnShow;
        const txtTipBtnHide = x.txtTipBtnHide;
        const txtSolutionBtnShow = x.txtSolutionBtnShow;
        const txtSolutionBtnHide = x.txtSolutionBtnHide;
        const tipIntro = x.tipIntro;

        // Get few style params
        const centerWidget = x.center;
        const scrollWidget = x.scroll;
        const fontFamily = x.fontFamily;
        const fontSize = x.fontSize;
        const titleFontSize = x.titleFontSize;
        const descriptFontSize = x.descriptFontSize;
        const clozeWidth = x.clozeWidth;
        const clozeHeight = x.clozeHeight;
        const blanksWidth = x.blanksWidth;
        const blanksAlign = x.blanksAlign;
        const titleCol = x.titleCol;
        const titleBg = x.titleBg;
        const submitBtnBg = x.submitBtnBg;
        const submitBtnHover = x.submitBtnHover;
        const submitBtnCol = x.submitBtnCol;
        const tipBtnBg = x.tipBtnBg;
        const tipBtnHover = x.tipBtnHover;
        const tipBtnCol = x.tipBtnCol;
        const solutionBtnBg = x.solutionBtnBg;
        const solutionBtnHover = x.solutionBtnHover;
        const solutionBtnCol = x.solutionBtnCol;
        const tipAreaBg = x.tipAreaBg;
        const tipAreaBorder = x.tipAreaBorder;
        const solutionAreaBg = x.solutionAreaBg;
        const solutionAreaBorder = x.solutionAreaBorder;


        // ------------ Create all HTML elements -----------------------

        var divWidget = document.getElementById(widgetId); // has to be var and not const or let

        // Modify parent element (the htmlwidget div)
        divWidget.style.borderRadius = "5px";
        if (centerWidget === "true") {
          divWidget.style.marginLeft = "auto";
          divWidget.style.marginRight = "auto";
        }
        if (scrollWidget === "true") {
          divWidget.style.overflowY = "auto";
          divWidget.style.overflowX = "hidden";
        }

        // QUIZ CONTAINER
        const divQuiz = document.createElement("div");
        divQuiz.classList.add("fgq-quiz");
        divQuiz.style.fontFamily = fontFamily;
        divQuiz.style.fontSize = fontSize+'px';
        divWidget.appendChild(divQuiz);

        // HEADER PART
        const divHeader = document.createElement("div");
        divHeader.classList.add("fgq-header");
        divHeader.style.color = titleCol;
        divHeader.style.backgroundColor = titleBg;
        if (title !== "NULL" || descript !== "NULL") {
          divHeader.style.padding = fontSize*0.625+'px 20px';
        } else {
          divHeader.style.padding = '0';
        }
        divQuiz.appendChild(divHeader);

        if (title !== "NULL") {
          const pTitle = document.createElement("p");
          pTitle.classList.add("fgq-title");
          pTitle.innerHTML = title;
          pTitle.style.color = titleCol;
          pTitle.style.backgroundColor = titleBg;
          pTitle.style.fontFamily = fontFamily;
          pTitle.style.fontSize = titleFontSize+'px';
          pTitle.style.margin = '0 0 '+titleFontSize*0.2+'px 0';
          divHeader.appendChild(pTitle);
        }
        if (descript !== "NULL") {
          const pDescript = document.createElement("p");
          pDescript.classList.add("fgq-description");
          pDescript.innerHTML = descript;
          pDescript.style.color = titleCol;
          pDescript.style.backgroundColor = titleBg;
          pDescript.style.fontFamily = fontFamily;
          pDescript.style.fontSize = descriptFontSize+'px';
          divHeader.appendChild(pDescript);
        }

        // MAIN PART
        const divMain = document.createElement("div");
        divMain.classList.add("fgq-main");
        divQuiz.appendChild(divMain);

        // CLOZE PART
        const divCloze = document.createElement("div");
        divCloze.classList.add("fgq-cloze");
        divCloze.innerHTML = quizCloze;
        divCloze.style.width = clozeWidth;
        divCloze.style.fontFamily = fontFamily;
        divCloze.style.fontSize = fontSize+'px';
        divCloze.style.lineHeight = fontSize*2.5+'px';
        if (clozeHeight !== "NULL") {
          divCloze.style.minHeight = clozeHeight;
        }
        divMain.appendChild(divCloze);

        // Auto-size blank fields based on longest answer
        if (blanksWidth === "auto") {
          // Collect all answer texts
          var answerTexts = [];
          if (typeof quizAnswers === 'string') {
            answerTexts.push(quizAnswers);
          } else if (Array.isArray(quizAnswers)) {
            answerTexts = quizAnswers.slice();
          } else if (typeof quizAnswers === 'object' && quizAnswers !== null) {
            answerTexts = Object.values(quizAnswers);
          }
          // Measure text width using a hidden span
          var measureSpan = document.createElement('span');
          measureSpan.style.visibility = 'hidden';
          measureSpan.style.position = 'absolute';
          measureSpan.style.whiteSpace = 'nowrap';
          measureSpan.style.fontFamily = fontFamily;
          measureSpan.style.fontSize = fontSize + 'px';
          document.body.appendChild(measureSpan);
          var maxWidth = 0;
          answerTexts.forEach(function(txt) {
            measureSpan.textContent = txt;
            var w = measureSpan.offsetWidth;
            if (w > maxWidth) maxWidth = w;
          });
          document.body.removeChild(measureSpan);
          // Add padding (20px each side) for comfortable fit, minimum 50px
          var autoWidth = Math.max(maxWidth + 40, 50) + 'px';
          var inputs = divCloze.querySelectorAll('.fgq-target');
          inputs.forEach(function(inp) {
            inp.style.width = autoWidth;
          });
        }

        // BUTTONS DIV
        const divButtons = document.createElement("div");
        divButtons.classList.add("fgq-buttons");
        divMain.appendChild(divButtons);

        // SUBMIT BUTTON
        const buttonSubmit = document.createElement('button');
        buttonSubmit.classList.add("fgq-button-submit");
        buttonSubmit.classList.add("fgq-button");
        buttonSubmit.setAttribute('tabindex', '0');
        buttonSubmit.textContent = txtSubmitBtn;
        buttonSubmit.style.color = submitBtnCol;
        buttonSubmit.style.backgroundColor = submitBtnBg;
        divButtons.appendChild(buttonSubmit);

        // ADD EVENT LISTENER FOR THE SUBMIT BUTTON TO CHECK THE ANSWERS
        buttonSubmit.addEventListener('click', function () {
          let score = 0;
          let totalQuestions = 0;

          if (typeof quizAnswers === 'string') {
            totalQuestions = 1;
            const userAnswer = document.querySelector(`#${widgetId} .fgq-target[data-accept="1"]`).value;
            if (userAnswer === quizAnswers) {
              score++;
            }
          } else if (Array.isArray(quizAnswers)) {
            totalQuestions = quizAnswers.length;
            quizAnswers.forEach((part, index) => {
              const userAnswer = document.querySelector(`#${widgetId} .fgq-target[data-accept="${index + 1}"]`).value;
              if (userAnswer === part) {
                score++;
              }
            });
          } else if (typeof quizAnswers === 'object' && quizAnswers !== null) {
            totalQuestions = Object.keys(quizAnswers).length;
            const entries = Object.entries(quizAnswers);
            entries.forEach(([key, part], index) => {
              const userAnswer = document.querySelector(`#${widgetId} .fgq-target[data-accept="${index + 1}"]`).value;
              if (userAnswer === part) {
                score++;
              }
            });
          } else {
          }

          var resultTemplate = (score === totalQuestions) ? x.txtResultCorrect : x.txtResultWrong;
          var resultText = resultTemplate.replace("{score}", score).replace("{total}", totalQuestions);
          alert(resultText);
        });


        // TIP BUTTON
        if (showTipBtn === "true") {
          const buttonTip = document.createElement('button');
          buttonTip.classList.add("fgq-button-tip");
          buttonTip.classList.add("fgq-button");
          buttonTip.setAttribute('tabindex', '0');
          buttonTip.textContent = txtTipBtnShow;
          // add user-specific CSS
          buttonTip.style.color = tipBtnCol;
          buttonTip.style.backgroundColor = tipBtnBg;
          buttonTip.setAttribute('aria-expanded', 'false');
          buttonTip.setAttribute('aria-controls', widgetId + '-tips');
          // Append to divButtons
          divButtons.appendChild(buttonTip);

          const divTips = document.createElement("div");
          divTips.classList.add("fgq-tips");
          divTips.id = widgetId + '-tips';
          // add user-specific CSS
          divTips.style.backgroundColor = tipAreaBg;
          divTips.style.borderColor = tipAreaBorder;
          // Append to divMain
          divMain.appendChild(divTips);

          const pTipsIntro = document.createElement("p");
          pTipsIntro.classList.add("fgq-tips-intro");
          pTipsIntro.textContent = tipIntro;
          // Append to divTips
          divTips.appendChild(pTipsIntro);

          const pTipsOptions = document.createElement("p");
          pTipsOptions.classList.add("fgq-tips-options");
          // Append to divTips
          divTips.appendChild(pTipsOptions);

          // TOGGLE TIPS VISIBILITY
          let tipsVisible = false;
  
          buttonTip.addEventListener('click', function () {
            tipsVisible = !tipsVisible; // Toggle state
            buttonTip.setAttribute('aria-expanded', tipsVisible ? 'true' : 'false');

            if (tipsVisible) {
              pTipsOptions.innerHTML = quizOptions;
              // Show the tips section and change button text
              divTips.style.display = 'block';
              buttonTip.textContent = txtTipBtnHide;
            } else {
              // Hide the tips section and reset button text
              divTips.style.display = 'none';
              buttonTip.textContent = txtTipBtnShow;
            }
          });
  
        }


        // SOLUTION BUTTON
        if (showSolutionBtn === "true") {
          const buttonSolution = document.createElement('button');
          buttonSolution.classList.add("fgq-button-solution");
          buttonSolution.classList.add("fgq-button");
          buttonSolution.setAttribute('tabindex', '0');
          buttonSolution.textContent = txtSolutionBtnShow;
          buttonSolution.style.color = solutionBtnCol;
          buttonSolution.style.backgroundColor = solutionBtnBg;
          buttonSolution.setAttribute('aria-expanded', 'false');
          divButtons.appendChild(buttonSolution);

          let solutionVisible = false;

          buttonSolution.addEventListener('click', function () {
            solutionVisible = !solutionVisible;  // Toggle state
            buttonSolution.setAttribute('aria-expanded', solutionVisible ? 'true' : 'false');

            // If quizAnswers is a string (single answer case)
            if (typeof quizAnswers === 'string') {
              const inputElement = document.querySelector(`#${widgetId} .fgq-target[data-accept="1"]`);

              if (solutionVisible) {
                if (inputElement) {
                  inputElement.value = quizAnswers;  // Set the answer
                }
                buttonSolution.textContent = txtSolutionBtnHide;
              } else {
                if (inputElement) {
                  inputElement.value = "";  // Clear the input
                }
                buttonSolution.textContent = txtSolutionBtnShow;
              }
            }
            // If quizAnswers is an array (multiple answers case)
            else if (Array.isArray(quizAnswers)) {
              quizAnswers.forEach((part, index) => {
                const inputElement = document.querySelector(`#${widgetId} .fgq-target[data-accept="${index + 1}"]`);

                if (solutionVisible) {
                  if (inputElement) {
                    inputElement.value = part;  // Set the correct answer
                  }
                  buttonSolution.textContent = txtSolutionBtnHide;
                } else {
                  if (inputElement) {
                    inputElement.value = "";  // Clear the input
                  }
                  buttonSolution.textContent = txtSolutionBtnShow;
                }
              });
            }
            // If quizAnswers is an object (multiple key-value pairs case)
            else if (typeof quizAnswers === 'object' && quizAnswers !== null) {
              const entries = Object.entries(quizAnswers);
              entries.forEach(([key, part], index) => {
                const inputElement = document.querySelector(`#${widgetId} .fgq-target[data-accept="${index + 1}"]`);

                if (solutionVisible) {
                  if (inputElement) {
                    inputElement.value = part;  // Set the correct answer
                  }
                  buttonSolution.textContent = txtSolutionBtnHide;
                } else {
                  if (inputElement) {
                    inputElement.value = "";  // Clear the input
                  }
                  buttonSolution.textContent = txtSolutionBtnShow;
                }
              });
            }
          });
        }


        
      // end of renderValue Function
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
