# A3XX mCDU by Joshua Davidson (Octal450), Jonathan Redpath, and Matthew Maring (mattmaring)

# Copyright (c) 2020 Matthew Maring (mattmaring)

var windHISTPage = {
	title: nil,
	fontMatrix: [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]],
	arrowsMatrix: [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]],
	arrowsColour: [["ack", "ack", "ack", "ack", "ack", "ack"],["ack", "ack", "ack", "ack", "ack", "ack"]],
	L1: [nil, nil, "ack"], # content, title, colour
	L2: [nil, nil, "ack"],
	L3: [nil, nil, "ack"],
	L4: [nil, nil, "ack"],
	L5: [nil, nil, "ack"],
	L6: [nil, nil, "ack"],
	C1: [nil, nil, "ack"],
	C2: [nil, nil, "ack"],
	C3: [nil, nil, "ack"],
	C4: [nil, nil, "ack"],
	C5: [nil, nil, "ack"],
	C6: [nil, nil, "ack"],
	R1: [nil, nil, "ack"],
	R2: [nil, nil, "ack"],
	R3: [nil, nil, "ack"],
	R4: [nil, nil, "ack"],
	R5: [nil, nil, "ack"],
	R6: [nil, nil, "ack"],
	scroll: 0,
	vector: [],
	index: nil,
	computer: nil,
	new: func(computer) {
		var whp = {parents:[windHISTPage]};
		whp.computer = computer;
		whp._setupPageWithData();
		whp.updateTmpy();
		return whp;
	},
	del: func() {
		return nil;
	},
	_setupPageWithData: func() {
		me.title = "HISTORY WIND";
		me.titleColour = "wht";
		me.L1 = ["----/---", "", "blu"];
		me.L2 = ["----/---", "", "blu"];
		me.L3 = ["----/---", "", "blu"];
		me.L4 = ["----/---", "", "blu"];
		me.L5 = ["----/---", "", "blu"];
		me.L6 = [" CLIMB WIND", "", "wht"];
		me.C1 = ["FL050", "", "blu"];
		me.C2 = ["FL150", "", "blu"];
		me.C3 = ["FL250", "", "blu"];
		me.C4 = ["       FL--- CRZ FL", "", "blu"];
		me.C5 = ["FL370", "", "blu"];
		me.R6 = ["SELECT ", "", "amb"];

		me.arrowsMatrix = [[0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0]];
		me.arrowsColour = [["ack", "ack", "ack", "ack", "ack", "wht"], ["ack", "ack", "ack", "ack", "ack", "ack"]];
		me.fontMatrix = [[1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0]];
		canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
	},
	makeTmpy: func() {
		if (!fmgc.flightPlanController.temporaryFlag[me.computer]) {
			fmgc.flightPlanController.createTemporaryFlightPlan(me.computer);
		}
	},
	updateTmpy: func() {
		if (fmgc.flightPlanController.temporaryFlag[me.computer]) {
			me.L1[2] = "yel";
			me.L2[2] = "yel";
			me.L3[2] = "yel";
			me.L4[2] = "yel";
			me.L5[2] = "yel";
			me.C1[2] = "yel";
			me.C2[2] = "yel";
			me.C3[2] = "yel";
			me.C4[2] = "yel";
			me.C5[2] = "yel";
			canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
		} else {
			me.L1[2] = "blu";
			me.L2[2] = "blu";
			me.L3[2] = "blu";
			me.L4[2] = "blu";
			me.L5[2] = "blu";
			me.C1[2] = "blu";
			me.C2[2] = "blu";
			me.C3[2] = "blu";
			me.C4[2] = "blu";
			me.C5[2] = "blu";
			canvas_mcdu.pageSwitch[me.computer].setBoolValue(0);
		}
	},
	reload: func() {
		me._setupPageWithData();
		me.updateTmpy();
	}
};