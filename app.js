const SIZE_CONFIG = {
  small: {
    label: "Small",
    reviewers: [
      { name: "Domain Architect", role: "Required" },
    ],
  },
  medium: {
    label: "Medium",
    reviewers: [
      { name: "Domain Architect", role: "Required" },
      { name: "Security Reviewer", role: "Required" },
    ],
  },
  large: {
    label: "Large",
    reviewers: [
      { name: "Domain Architect", role: "Required" },
      { name: "Security Reviewer", role: "Required" },
      { name: "Principal Architect", role: "Required" },
    ],
  },
  xlarge: {
    label: "X-Large",
    reviewers: [
      { name: "Domain Architect", role: "Required" },
      { name: "Security Reviewer", role: "Required" },
      { name: "Principal Architect", role: "Required" },
      { name: "Chief Architect", role: "Required" },
      { name: "VP Engineering", role: "Required" },
    ],
  },
};

const state = {
  size: null,
  title: "",
  notes: "",
  approvals: {},
};

const views = document.querySelectorAll(".view");
const steps = document.querySelectorAll(".step");

function showView(name) {
  views.forEach((v) => {
    v.hidden = v.dataset.view !== name;
  });
  const order = ["size", "approval", "summary"];
  const currentIdx = order.indexOf(name);
  steps.forEach((s, i) => {
    s.classList.toggle("active", i === currentIdx);
    s.classList.toggle("done", i < currentIdx);
  });
  window.scrollTo({ top: 0, behavior: "smooth" });
}

// Step 1: Size selection
const sizeRadios = document.querySelectorAll('input[name="arb-size"]');
const titleInput = document.getElementById("arb-title");
const nextBtn = document.getElementById("next-to-approval");

function updateNextButton() {
  nextBtn.disabled = !state.size || !state.title.trim();
}

sizeRadios.forEach((r) => {
  r.addEventListener("change", () => {
    state.size = r.value;
    updateNextButton();
  });
});

titleInput.addEventListener("input", () => {
  state.title = titleInput.value;
  updateNextButton();
});

nextBtn.addEventListener("click", () => {
  renderApprovalView();
  showView("approval");
});

// Step 2: Approval
const approvalTitle = document.getElementById("approval-title");
const approvalSize = document.getElementById("approval-size");
const reviewerList = document.getElementById("reviewer-list");
const notesInput = document.getElementById("approval-notes");
const submitBtn = document.getElementById("submit-approval");
const backBtn = document.getElementById("back-to-size");

function renderApprovalView() {
  const config = SIZE_CONFIG[state.size];
  approvalTitle.textContent = state.title;
  approvalSize.textContent = config.label;

  reviewerList.innerHTML = "";
  state.approvals = {};
  config.reviewers.forEach((rev, idx) => {
    state.approvals[idx] = false;
    const li = document.createElement("li");
    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.id = `reviewer-${idx}`;
    checkbox.addEventListener("change", () => {
      state.approvals[idx] = checkbox.checked;
      updateSubmitButton();
    });
    const label = document.createElement("label");
    label.htmlFor = checkbox.id;
    label.textContent = rev.name;
    const role = document.createElement("span");
    role.className = "reviewer-role";
    role.textContent = rev.role;
    li.append(checkbox, label, role);
    reviewerList.append(li);
  });

  updateSubmitButton();
}

function updateSubmitButton() {
  const allApproved = Object.values(state.approvals).every(Boolean);
  submitBtn.disabled = !allApproved;
}

backBtn.addEventListener("click", () => showView("size"));

submitBtn.addEventListener("click", () => {
  state.notes = notesInput.value;
  renderSummary();
  showView("summary");
});

// Step 3: Summary
const summaryTitle = document.getElementById("summary-title");
const summarySize = document.getElementById("summary-size");
const summaryReviewers = document.getElementById("summary-reviewers");
const startOverBtn = document.getElementById("start-over");

function renderSummary() {
  const config = SIZE_CONFIG[state.size];
  summaryTitle.textContent = state.title;
  summarySize.textContent = config.label;
  summaryReviewers.textContent = config.reviewers.map((r) => r.name).join(", ");
}

startOverBtn.addEventListener("click", () => {
  state.size = null;
  state.title = "";
  state.notes = "";
  state.approvals = {};
  sizeRadios.forEach((r) => (r.checked = false));
  titleInput.value = "";
  notesInput.value = "";
  updateNextButton();
  showView("size");
});

// Init
showView("size");
