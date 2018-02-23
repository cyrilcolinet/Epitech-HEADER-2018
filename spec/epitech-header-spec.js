'use babel';

import PhoenixEpitechHeaders from '../lib/epitech-header';

describe('EpitechHeader', () => {
  let workspaceElement, activationPromise;

  beforeEach(() => {
    workspaceElement = atom.views.getView(atom.workspace);
    activationPromise = atom.packages.activatePackage('epitech-header');
  });
});
